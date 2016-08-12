# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=devpkgcheck
pkgver=1.3
pkgrel=1
pkgdesc="Tool that builds and tests pkgbuilds with vcs sources from the AUR"
arch=('any')
url="https://gitlab.com/silentboatman/devpkgcheck"
license=('GPL3')
depends=('namcap')
backup=('etc/devpkgcheck.conf')
source=("https://gitlab.com/silentboatman/${pkgname}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('8d519626b8165bc19fa95ccf898b046aea1bef3e8b339c27a5e7491fe9008453')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"*

  install -D "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${pkgname}.conf" -t "${pkgdir}/etc"
  install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=2 sw=2 et:
