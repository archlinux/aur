# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname='yandex-disk'
pkgver=0.1.5.905
pkgrel=1
pkgdesc='Yandex.Disk keeps your files with you at all times.'
arch=('i686' 'x86_64')
url='http://disk.yandex.ru/'
license=('custom')
depends=('glibc>=2.4' 'gcc-libs>=4.4.3')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'
install=yandex-disk.install
source=("http://repo.yandex.ru/yandex-disk/deb/pool/main/y/yandex-disk/yandex-disk_${pkgver}_${_arch}.deb"
        "yandex-disk.install"
        "yandex-disk.service")
 
md5sums=('ef20b3fb147c4be4b6085d72c5b70567'
         '5ad775bd895526c6b1f335c6d71dbdfa'
         '682610854f31ae387a35268ff2fcb867')
 
[ "$CARCH" = "x86_64" ] && 
md5sums=('6edca3196ab3c2c98199143fdf67d830'
         '5ad775bd895526c6b1f335c6d71dbdfa'
         '682610854f31ae387a35268ff2fcb867')
 
package() {
        cd $srcdir
 
        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir
 
        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}