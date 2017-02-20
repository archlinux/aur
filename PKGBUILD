# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-doit
_pyname=doit
pkgver=0.30.3
pkgrel=1
pkgdesc='doit automation tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
depends=('python' 'python-pyinotify' 'python-six' 'python-setuptools' 'python-cloudpickle')
md5sums=('8e574838ca72f7174f24c17d2c65639c')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
  install -D -m755 'zsh_completion_doit' "${pkgdir}/usr/share/zsh/site-functions/_${_pyname}"
  install -D -m755 'bash_completion_doit' "${pkgdir}/usr/share/bash-completion/completions/${_pyname}"
}

# vim:set ts=2 sw=2 et:
