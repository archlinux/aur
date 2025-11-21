# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.8/ai_pkg-0.1.8-py3-none-any.whl")
sha256sums=('f3706d760b8efe71ba7be83e1f0debe8e5c4c1d251a8f0113dc21c7cd6f8eebe')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.8-py3-none-any.whl
    pip install google-genai --break-system-packages
}
