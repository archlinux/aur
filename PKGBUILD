pkgname='python-hmms'
_name='hmms'
pkgver=0.1
pkgrel=1
pkgdesc='Discrete-time and continuous-time hidden Markov model library'
url='https://pypi.python.org/pypi/hmms'
depends=('python' 'cython' 'ipython' 'python-matplotlib' 'jupyter-notebook' 'python-numpy' 'python-pandas' 'python-scipy')
license=('Public Domain')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('0d586c8d120355328e5a96ba4da9c950')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	sed -i 's/include_dirs/include_path/' setup.py
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}

