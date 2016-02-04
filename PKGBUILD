# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname='yandex-disk'
pkgver=0.1.5.948
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
 
sha512sums=('673ce1f792e8acb9062a9ab3c5977f84cff9079e31bef1d58b105533ca5a3e0564628146e4cd634aa79415ac1128e1b3b55ce03495b8ec2ce3b8d88282e6238e'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')
 
[ "$CARCH" = "x86_64" ] && 
sha512sums=('ab0e61f17ed6ca93e845d981b2186e34244d13bcd2a6888eb309b564678e5775ea1d046fa83c84dd2012fd9373b2615d42d39b19e42addf7a78e20e2f89402b0'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '26803f67069e23e5ef82d3a127e01400d7db5fa03b1904f64b5cacbfd705b4d0f43e26f6cb93b74e333ca01f911b0212cdb3fba20188c793fdde6e14449b38a9')
 
package() {
        cd $srcdir
 
        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir
 
        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
