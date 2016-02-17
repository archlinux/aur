pkgname=prosody-mod-cloud-notify
pkgver=r2049.50c188cf0ae3
pkgrel=1
pkgdesc="XEP-0357: Push Notifications for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_cloud_notify.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_cloud_notify"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
