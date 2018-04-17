# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="certbot-dns-inwx-git"
pkgdesc="INWX DNS authenticator plugin for certbot - GIT version"
pkgver=20180409.d59cb0f
pkgrel=1
arch=("any")
url="https://github.com/oGGy990/certbot-dns-inwx"
license=("Apache")
depends=("certbot")
makedepends=("python-setuptools")
provides=("certbot-dns-inwx")
backup=(
  "etc/letsencrypt/inwx.cfg"
)
source=(
  "certbot-dns-inwx::git://github.com/oGGy990/certbot-dns-inwx.git"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "${srcdir}/certbot-dns-inwx"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

package() {
  cd "${srcdir}/certbot-dns-inwx"
  python setup.py install --root="${pkgdir}"
  chmod 0600 "${pkgdir}/etc/letsencrypt/inwx.cfg"
}
