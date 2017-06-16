# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timedoctorpro
pkgver=1.4.75.14
urlver=$(echo $pkgver|sed 's/\.\([^.]*\)$/-\1/')
pkgrel=7
arch=('x86_64')
pkgdesc="App to track work time from timedoctor.com"
url="https://www.timedoctor.com/download.html"
license=('proprietary')

#maybe also depends=('libxss')
depends=('libx11' 'libxcb' 'zlib' 'qt4' 'opencv2-opt' 'jasper' 'openssl-1.0')

source=(
    "https://updates.timedoctor.com/download/_production/tdpro/linux-ubuntu-16.04/timedoctorpro_${urlver}ubuntu16.04_amd64.deb"
#    "https://archive.archlinux.org/packages/j/jasper/jasper-1.900.5-1-x86_64.pkg.tar.xz"
)
md5sums=(
    "0d50154852f5f10bd8e470066f61a523"
#    "c8360ae58c424f1c1d4cff50d56e47ec"
)

package() {
        cd $pkgdir
        tar -xf $srcdir/data.tar.xz
        patch -p1 < ../../timedoctorpro.patch
#        cp $srcdir/usr/lib/libjasper.so.1.0.0 opt/timedoctorpro/libjasper.so.1

}
