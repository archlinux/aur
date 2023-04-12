# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mondoo
orignalVersion="8.5.0"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Mondoo Client CLI for the Mondoo Policy as Code Platform"
url="https://mondoo.com"
license=('custom')
source=(
    "https://releases.mondoo.com/mondoo/${orignalVersion}/mondoo_${orignalVersion}_linux_amd64.tar.gz"
    'LICENSE.html'
    'OSS-LICENSES.tar.xz'
    'mondoo.service'
    'mondoo.sh'
    )
arch=('x86_64')
depends=('cnspec')

sha256sums=('7d0285b9c28c9b59204ac1cf7c398fa83ca3273ac6420636fb43e851fcf43f8b'
            'c8d346670913c91bf712405e57c2311e6fbda37261f8abfadf9ca7e5fdd768bd'
            'cd99e204a986af5a91f46c43478b28f556a4f50fd9721844d0b600d45ac43cb8'
            '2febf46353886823e6a61ca15c73e651d71d45579b0a1a17e18905a61387e7e6'
            '92ceefe40c2963f96d02e36743338599cfa9a062d00a5e38580370099b01066c'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/opt/$pkgname/bin
  cp ${srcdir}/$pkgname ${pkgdir}/opt/$pkgname/bin/.

  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.tar.xz "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.tar.xz
  install -Dm 644 mondoo.service "$pkgdir"/usr/lib/systemd/system/mondoo.service
  install -Dm 755 mondoo.sh "$pkgdir"/usr/bin/mondoo
  
}

#vim: syntax=sh