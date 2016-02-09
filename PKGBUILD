pkgname=mailru-cloud
pkgver=15.05.0236
pkgrel=1
pkgdesc="Client of Cloud@Mail.Ru (Mail.Ru free online storage)."
arch=("i686" "x86_64")
url="http://cloud.mail.ru/"
license=("custom")
depends=("qt5-base")
sha256sums=("739e29e6266b7ef596379224becc093ec8ac67d940f08d661f65ca7f7f8a674f")
_arch=amd64
if [ "`uname -m`" = "i686" ]; then
    _arch=i386
    sha256sums=("f0f15d1dee71a1afdbb338d1183b5e47741a06f61817d88edddbc23a38813ac9")
fi
source=("https://linuxdesktopcloud.cdnmail.ru/deb/mail.ru-cloud_${pkgver}_${_arch}.deb")

package () {
    cd ${srcdir}
    ar x mail.ru-cloud_${pkgver}_${_arch}.deb
    tar -Jxf data.tar.xz -C ${pkgdir}/
    find ${pkgdir}/ -type d -exec chmod 755 {} \;
}
