# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Kessia Pinheiro <kessiapinheiro @ gmail.com>

pkgname=oinkmaster
pkgver=2.0
pkgrel=7
pkgdesc="A script that will help you update and manage your Snort rules"
arch=('i686' 'x86_64')
license=('BSD')
url="http://oinkmaster.sourceforge.net/"
depends=('snort')
backup=(
  'etc/oinkmaster.conf'
)
source=(
  "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  '3d52f0426aa7c81b122cef22b80d708d8bb8337537e48754a065804f46c46162'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m0655 -D 'oinkmaster.pl' "${pkgdir}/usr/bin/oinkmaster.pl"
  install -m0644 -D 'oinkmaster.conf' "${pkgdir}/etc/oinkmaster.conf"
  install -m0644 -D 'oinkmaster.1' "${pkgdir}/usr/man/man1/oinkmaster.1"
  install -d -m0644 "${pkgdir}/usr/share/oinkmaster/"
  install -d -m0755 "${pkgdir}/usr/share/licenses/oinkmaster/"
  install -m0644 -D 'template-examples.conf' "${pkgdir}/usr/share/oinkmaster/"
  cp -R 'contrib/' "${pkgdir}/usr/share/oinkmaster/"
  install -m0644 [[:upper:]]* "${pkgdir}/usr/share/oinkmaster/"
  install -m0644 -D 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/"
}
