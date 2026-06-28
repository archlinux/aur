# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-anonymise-odt-docx-git
_name="anonymize"
pkgver=r96.ae619ab
pkgrel=1
pkgdesc="Change authorship to ODT and DOCX comments, redlines and whatnot"
arch=(any)
url="https://github.com/kappapiana/${_name}"
license=('AGPL-3.0-or-later')
depends=('python')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  # There are tags, but the last one is super old so ignore them
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_name"
		install -Dm755 "${_name}.py" "${pkgdir}/usr/bin/$_name"
}
