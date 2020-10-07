
# Maintainer: Alfredo Palhares <alfredo at palhares dot me>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds
pkgname=kcadm
pkgver=11.0.2
pkgrel=1
pkgdesc="A command line Admin tool for Keycloak"
arch=('any')
url="https://www.keycloak.org/"
license=('GPL')
depends=("java-environment")
install=
changelog=
source=("https://downloads.jboss.org/keycloak/${pkgver}/keycloak-${pkgver}.tar.gz"
        "kcadm.sh")
sha256sums=('b1b3f7df63a6ff804adb9d8592df300aa7889765c02c65948960b4af96a88365'
            'c181c022e595ed7410d24f999ff46e202d1b33130df5806047483ca4997f5342')

package() {
  cd "keycloak-$pkgver"
  mkdir -p "${pkgdir}/var/lib/kcadm"
  mkdir -p "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/keycloak-${pkgver}/bin/client/keycloak-admin-cli-${pkgver}.jar" \
    "${pkgdir}/var/lib/kcadm/keycloak-admin-cli-${pkgver}.jar"
  install -m755 "${srcdir}/kcadm.sh" "${pkgdir}/usr/bin/kcadm"
}
