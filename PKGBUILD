# Maintainer: Rohan Kumar Singh <rohankrsingh125@gmail.com>
pkgname=ai-pkg-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

# Workflow will update this dynamically
source=("https://github.com/rohankrsingh/ai-pkg/releases/tag/v0.1.3/ai-pkg-0.1.3-py3-none-any.whl")
sha256sums=('37bebf099a88657da1f11f8114ddfada322bba0239869e6066612b508166d7b9')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-${pkgver}-py3-none-any.whl
}
