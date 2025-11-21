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
sha256sums=('829656e9debe70448938bf5ce6f2f9ef13319b9f832daeed7a2144cedb6c3119')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.8-py3-none-any.whl
    pip install google-genai --break-system-packages
}
