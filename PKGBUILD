# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=nicos
pkgver=3.9.0
pkgrel=2
pkgdesc="The Networked Instrument Control System of the MLZ"
arch=('x86_64')
url="https://nicos-controls.org/"
license=('GPL3')
groups=('nicos')
depends=(
  'python-setuptools'
  'python-pytango'
  'python-nicos-pyctl>=1.0'
  'python-scipy>=0.9'
  'python-numpy>=1.10.0'
  'python-pyzmq>=13.1.0'
  'python-rsa>=3.1.2'
  'python-ldap3>=2.0.0'
  'python-psutil>=2.0'
  'python-html2text'
  'python-lttb'
  'python-toml'
  'python-gr-framework'
  # Dev
  'python-coverage>=3.4'
  'python-isort'
  'python-pylint>=2.1.0'
  'python-pytest>=4.6'
  'python-pytest-cov'
  'python-pytest-timeout>=1.3.1'
  'python-mock>=1.0'
  'python-yaml>=3.0'
  'python-sphinx'
  'rst2pdf'
  'yapf'
  'python-sphinx_rtd_theme'
  'python-pytest-randomly'
  'python-pyftpdlib'
  'python-sphinxcontrib-seqdiag'
  # Opt
  'python-pyserial>=2.5'
  'python-astropy'
  'python-nicos-quickyaml>=1.1.0'
  'python-docutils'
  'python-redbaron'
  'python-keyring'
  'python-keyrings-alt'
  'python-pycryptodome'
  'python-sshtunnel'
  'python-requests'
  'python-pillow'
  'python-markdown'
  'python-h5py-openmpi'
  # Gui
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-qscintilla-qt5'
)
provides=('nicos')
conflicts=('nicos-git')
source=("https://forge.frm2.tum.de/packages/nicos-${pkgver}.tar.gz")
sha256sums=('19c4a6fe244f3e8362d78191ae6d194d170f6321923f4b0a2ad2622add158cfb')

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py check -mr
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py install --root=$pkgdir/
}
