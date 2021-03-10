# Maintainer: lmartinez-mirror
pkgname=vim-plantuml-git
pkgver=0.2.0.r48.geb3df30
pkgrel=1
pkgdesc="Vim syntax for PlantUML"
arch=('any')
url="https://github.com/aklt/plantuml-syntax"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('plantuml'
            'python-plantuml')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd plantuml-syntax
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd plantuml-syntax
  find ftdetect ftplugin indent syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
