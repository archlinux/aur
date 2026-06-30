# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.46
pkgrel=1
pkgdesc="A modern static site generator designed to simplify building and maintaining project documentation"
url="https://github.com/zensical/zensical"
license=('MIT')
depends=('python' 'glibc' 'libgcc' 'python-pandas' 'python-markupsafe' 'python-jinja' 'python-deepmerge'
  'python-markdown' 'python-click' 'python-yaml' 'python-tomli' 'python-pymdown-extensions' 'python-tabulate' 'mkdocstrings')
makedepends=('python-pip' 'python-wheel')
arch=('x86_64' 'aarch64' 'i686')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

_cpver="cp310"
source=('https://raw.githubusercontent.com/zensical/zensical/refs/tags/v0.0.46/LICENSE.md')
sha256sums=('565a37ce713028576fa564b10174afb9560a94af69164767307c29ef2711ecbb')
sha256sums_x86_64=('aef03fa186a5589148e10b62610500989c6b075a2c08e1554233adbf91b2a3dc')
sha256sums_aarch64=('ec43018d5343ca2e1d71aa352eeddd560fef504effd03025840a5a783abefa4f')
sha256sums_i686=('46fe578f26963f8ee89567983e62737b6fadc9197d4742e1020b522e092d7baa')
source_x86_64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
source_i686=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_i686.manylinux2014_i686.whl")

package() {
  cd "${srcdir}"
  pip install \
    --no-deps \
    --no-build-isolation \
    --root="${pkgdir}" \
    --prefix=/usr \
    "zensical-$pkgver-$_cpver-abi3-manylinux_2_17_$CARCH.manylinux2014_$CARCH.whl"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
