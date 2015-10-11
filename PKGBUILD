# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname='yandex-disk'
pkgver=0.1.5.940
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
 
md5sums=('98a2fa8b0e4b12f53c179f2e97af234e'
         '5ad775bd895526c6b1f335c6d71dbdfa'
         '682610854f31ae387a35268ff2fcb867')
 
[ "$CARCH" = "x86_64" ] && 
md5sums=('f4f3b9093ff30faa16a9df1504025947'
         '5ad775bd895526c6b1f335c6d71dbdfa'
         '682610854f31ae387a35268ff2fcb867')
 
package() {
        cd $srcdir
 
        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir
 
        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}