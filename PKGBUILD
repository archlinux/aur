# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mondoo
orignalVersion="9.13.0"
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

sha256sums=(''
            'f1a7d679603a68a01583d98252ca0079986962d3ceca9a47ce01e0640a42500f'
            'cd99e204a986af5a91f46c43478b28f556a4f50fd9721844d0b600d45ac43cb8'
            '2febf46353886823e6a61ca15c73e651d71d45579b0a1a17e18905a61387e7e6'
            '6eed5224af83aec8cbb751770c503eb11b15bd447aef67830922e4a2bdec4e3e'
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