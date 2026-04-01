# Maintainer: clalos <clalos at users dot noreply dot github dot com>

pkgname=browser-use-cli
_pyname=browser_use
pkgver=0.12.5
pkgrel=2
pkgdesc='CLI for browser automation with AI agents'
arch=(any)
url='https://github.com/browser-use/browser-use'
license=(MIT)
depends=(
  python
  python-aiohttp
  python-anyio
  python-click
  python-cloudpickle
  python-dotenv
  python-google-api-core
  python-google-api-python-client
  python-google-auth
  python-google-auth-oauthlib
  python-httpx
  python-markdownify
  python-openai
  python-pillow
  python-psutil
  python-pydantic
  python-pydantic-settings
  python-pypdf
  python-pyotp
  python-reportlab
  python-requests
  python-rich
  python-screeninfo
  python-textual
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
)
provides=(python-browser-use)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('ba032884d3a2380149da4914c908db5080fd0e9062d05bc6af20ae3a8606aec5')

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
