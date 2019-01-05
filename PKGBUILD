# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-locallib
pkgver=1.0.0
pkgrel=3
pkgdesc="Ensure /usr/local/lib/pythonX is in sys.path"
arch=("any")
license=("Unlicense")
depends=("python")
source=("sitecustomize.py")
sha256sums=("8ef1427696ee397b8d5ea081c04054e604648650aedbd609cbc5ad5a9de456bd")

package() {
    sitepkgs_dir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
    install -Dm644 sitecustomize.py "${pkgdir}${sitepkgs_dir}/sitecustomize.py"
}
