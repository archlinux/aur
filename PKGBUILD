# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-locallib
pkgver=1.0.0
pkgrel=6
pkgdesc="Ensure /usr/local/lib/pythonX is in sys.path"
arch=("any")
license=("Unlicense")
depends=("python")
source=("sitecustomize.py")
sha256sums=("8ef1427696ee397b8d5ea081c04054e604648650aedbd609cbc5ad5a9de456bd")

package() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0], end='')")
    install -Dm644 sitecustomize.py "${pkgdir}${_site_packages}/sitecustomize.py"
}
