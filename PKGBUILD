# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich' 'python-google-genai')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.8/ai_pkg-0.1.8-py3-none-any.whl")
sha256sums=('ebd49259c271957b4e5080ff8d7f670d83eddec7d91cc84a2df47dc835eff4b3')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.8-py3-none-any.whl
    pip install google-genai --break-system-packages
}
