# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
# TODO:
# - replace the html license with a proper TXT version
# - use upstream oss-licenses instead of bundling it

pkgname=mondoo
pkgver=6.3.0
pkgrel=1
pkgdesc="Infrastructure search, analytics, and security analysis"
url="https://mondoo.com"
license=('custom')
source=(
    "https://releases.mondoo.com/mondoo/${pkgver}/mondoo_${pkgver}_linux_amd64.tar.gz"
    'LICENSE.html::https://mondoo.com/terms'
    'OSS-LICENSES.tar.xz'
    'mondoo.service'
    'mondoo.sh'
)
arch=('x86_64')

sha256sums=('b2837da84431735631f008f65baeabd46c3b8b220d7925a6ace14f844db79613'
            '490d47ec3d892b3cab9f37b8e4379f4534f7ce1bfb1dcadd0184d7d1896e86ce'
            'cd99e204a986af5a91f46c43478b28f556a4f50fd9721844d0b600d45ac43cb8'
            '2febf46353886823e6a61ca15c73e651d71d45579b0a1a17e18905a61387e7e6'
            '92ceefe40c2963f96d02e36743338599cfa9a062d00a5e38580370099b01066c')


package() {
  install -dm755 ${pkgdir}/opt/$pkgname/bin \
                 ${pkgdir}/usr/bin

  cp ${srcdir}/$pkgname ${pkgdir}/opt/$pkgname/bin/.

  install -Dm 755 mondoo.sh ${pkgdir}/usr/bin/mondoo
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.tar.xz "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.tar.xz
  install -Dm 644 mondoo.service "$pkgdir"/usr/lib/systemd/system/mondoo.service
}

#vim: syntax=sh
