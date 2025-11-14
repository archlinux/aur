# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="edid-json-tools-patch_edid"
pkgver=r74.5e0ef9d
pkgrel=1
pkgdesc='Parsing and converting between EDID binaries and JSON files. Fork with added patch_edid tool.'
arch=('any')
url='https://github.com/Joel-Valenciano/edid-json-tools'
depends=('python')
makedepends=('python-setuptools' 'python-pip')
# optdepends=('')
# provides=("")

license=('BSL-1.0')
source=("git+https://github.com/Joel-Valenciano/edid-json-tools.git")
md5sums=('SKIP')

#options=('debug' '!strip')

pkgver() {
  cd edid-json-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd edid-json-tools
}

build() {
  cd edid-json-tools
}

package() {
  cd edid-json-tools

  # Do not install [CLI] because it brings click with it
  pip install --isolated --root="$pkgdir" --ignore-installed --no-warn-script-location --editable .

  install -Dm644 "$srcdir"/edid-json-tools/LICENSE.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
