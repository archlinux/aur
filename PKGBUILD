# Maintainer: ZJLIN <zjin841126@gmail.com>
pkgname=trimmomatic
pkgver=0.36
pkgrel=1
pkgdesc='Trimmomatic: A flexible read trimming tool for Illumina NGS data'
arch=('any')
url="http://www.usadellab.org/cms/?page=trimmomatic"
license=('GPL3')
depends=('java-environment>=6')
source=("http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-$pkgver.zip")
md5sums=('8549130d86b6f0382b1a71a2eb45de39')

package() {
    mkdir $pkgdir/opt/
    mv $srcdir/Trimmomatic-$pkgver $srcdir/Trimmomatic
    cp -r $srcdir/Trimmomatic/ $pkgdir/opt/

    mkdir -p "${pkgdir}/usr/bin/"
    execmd=("exec java -jar /opt/Trimmomatic/trimmomatic-$pkgver.jar"' "$@"')
    echo $execmd > $pkgdir/opt/Trimmomatic/trimmomatic
    chmod 755 $pkgdir/opt/Trimmomatic/trimmomatic
    ln -s "/opt/Trimmomatic/trimmomatic" "${pkgdir}/usr/bin"
}
