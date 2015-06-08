pkgname=mailru-cloud
pkgver=15.04.0021
pkgrel=1
pkgdesc="Client of Cloud@Mail.Ru (Mail.Ru free online storage)."
arch=("i686" "x86_64")
url="http://cloud.mail.ru/"
license=("custom")
depends=("qt5-base")
sha256sums=("08aeadcf8b01ca119730f58cf2423600c2be1a252076c14363108c120969a639")
_arch=amd64
if [ "`uname -m`" = "i686" ]; then
    _arch=i386
    sha256sums=("5bebbdc20d224a066f49b7f853d5be15a8efe6e3013190efb77628a218b0e049")
fi
source=("https://linuxdesktopcloud.cdnmail.ru/deb/mail.ru-cloud_${pkgver}_${_arch}.deb")

package () {
    cd ${srcdir}
    ar x mail.ru-cloud_${pkgver}_${_arch}.deb
    tar -Jxf data.tar.xz -C ${pkgdir}/
    find ${pkgdir}/ -type d -exec chmod 755 {} \;
}