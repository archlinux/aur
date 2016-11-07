# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname='yandex-disk'
pkgver=0.1.5.978
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

sha512sums=('db690d4b346bba3730f94132f7179f85e2a00e276cc5f4c8c9e128c9a5744e1d4b05dc6eb8de468ee45c223df34f48cdaf439bb7dfe2d7942033a5c554a747aa'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')

[ "$CARCH" = "x86_64" ] &&
sha512sums=('1889f8d3e8f59fcefb7d09422ee9a5e5da2255599c71ef0e5d413871f27c1d155f7548bffe2eca6ba101d7ed0fd2c24ed655eb6e792f6076d8e88dc0daeb7a2f'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')

package() {
        cd $srcdir

        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir

        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
