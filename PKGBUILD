# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-auth-sso-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="The sso authentication extension for Guacamole Client. It includes cas, openid and saml."
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
install=guacamole-auth.install
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-sso-${pkgver}.tar.gz")

md5sums=('19bfa887a516f6badc0eea9f40444cfa')

package() {
  cd "${srcdir}/guacamole-auth-sso-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  for _s in cas openid saml ; do
    install -m 644 -D ${_s}/guacamole-auth-sso-${_s}-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
  done
}
