# Maintainer: 0xbbuddha <killian@archimedeos.org>

pkgname=evil-winrm-py
pkgver=1.5.0
pkgrel=1
pkgdesc="The ultimate WinRM shell for hacking/pentesting."
arch=('any')
url="https://github.com/adityatelange/evil-winrm-py"
license=('MIT')
provides=('evil-winrm-py')
conflicts=('evil-winrm-py')
depends=('python' 'python-pypsrp' 'python-prompt_toolkit' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("evil_winrm_py-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d8/e6/0f39fbc92ce26afd0ce79acadbacc312c81f3d438d3bf625a03f1a01c474/evil_winrm_py-${pkgver}.tar.gz")
sha256sums=('4f97ee36f236dd6b1af770470a5f844d97a9f42b4efe720b3781094661b161ad')

build() {
  cd "${srcdir}/evil_winrm_py-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/evil_winrm_py-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}


