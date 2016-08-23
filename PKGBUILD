# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname='yandex-disk'
pkgver=0.1.5.976
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

sha512sums=('a7f5ccb5002001c8112d223e847f8c2bd446e3755c8c5718fe6387cd9bd3274e2b80a465929d29f1cf54726e054b2680ffaba80b77a4ecf22b131c43eac9d8f6'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')

[ "$CARCH" = "x86_64" ] &&
sha512sums=('6c2a87b40d7832893b0a56aa4653574566179e8b258da828c5e494b218be8c1febec1c5abdfc364196b46f34ea882512f346d305584f5acba1809fe5c8ef135b'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')

package() {
        cd $srcdir

        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir

        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
