# Maintianer: Jordan Pierce <jordan.pierce.00@gmail.com>
pkgname=nion-swift
pkgver=0.5.7
pkgrel=1
pkgdesc="Program developed by Nion Co. for interfacing with electron microscopes and for data analysis."
arch=('i686' 'x86_64')
url="http://nion.com/swift/"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'python' 'python-numpy' 'python34')
makedepend=('unzip')
# install=$pkgname.install
source=("${pkgname}.zip::http://nion.com/swift/files/NionSwift_Linux_x64_python3.4m_0.5.7.zip")
# source=("${pkgname}.zip::http://lythium.uoregon.edu/~jordan/NionSwift_Linux_x64_0.5.1.zip")
# noextract=("NionSwift_Linux_x64_0.5.1.zip")
md5sums=("SKIP")
# pkgdir="/usr/local/"

# build() {
#     cd "$srcdir"
#     msg "Uzipping"
#     unzip ${pkgname}.zip
#     # find . -name "*.pyc" -exec rm -f {} \;
# }

package() {
    # cd "$srcdir/NionSwift_python3.4m_0.5.7"
    # echo "`ls`"
    mkdir -p $pkgdir/usr/local/
    cp -Rax $srcdir/NionSwift_python3.4m_0.5.7/ $pkgdir/usr/local/
    mv $pkgdir/usr/local/NionSwift_python3.4m_0.5.7/ $pkgdir/usr/local/NionSwift
    # cp -R NionSwift $pkgdir/usr/local/
    # echo "startdir $startdir"
    # echo "pkgdir $pkgdir"
    # echo "`ls $startdir`"

    mkdir -p $pkgdir/usr/share/{applications,pixmaps}
    install -Dm644 $startdir/nionswift.desktop $pkgdir/usr/share/applications/
    install -Dm644 $startdir/nionswift.png $pkgdir/usr/share/pixmaps/

    mkdir -p $pkgdir/usr/bin
    chmod +x $pkgdir/usr/local/NionSwift/NionSwift
    ln -s $pkgdir/usr/local/NionSwift/NionSwift $pkgdir/usr/bin/NionSwift
}
