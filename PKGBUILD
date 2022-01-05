
# Maintainer: Alfredo Palhares <alfredo at palhares dot me>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds
pkgname=kcadm
pkgver=15.0.2
pkgrel=1
pkgdesc="A command line Admin tool for Keycloak"
arch=('any')
url="https://www.keycloak.org/"
license=('GPL')
depends=("java-environment")
install=
changelog=
source=("https://github.com/keycloak/keycloak/releases/download/${pkgver}/keycloak-${pkgver}.tar.gz"
        "kcadm.sh")
sha256sums=('1915e33b3789eb426fda06676e39b9ddf3a7b563e1e2381a92a02da814dad047'
            'c181c022e595ed7410d24f999ff46e202d1b33130df5806047483ca4997f5342')

package() {
  cd "keycloak-$pkgver"
  mkdir -p "${pkgdir}/var/lib/kcadm"
  mkdir -p "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/keycloak-${pkgver}/bin/client/keycloak-admin-cli-${pkgver}.jar" \
    "${pkgdir}/var/lib/kcadm/keycloak-admin-cli-${pkgver}.jar"
  install -m755 "${srcdir}/kcadm.sh" "${pkgdir}/usr/bin/kcadm"
}
