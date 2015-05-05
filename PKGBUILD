# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-nikola-git
_pyname=nikola
_gitname=nikola
pkgver=7.4.0.r0.g3f3a051
pkgrel=1
pkgdesc='A modular, fast, simple, static website generator.  (git version)'
arch=('any')
url='http://getnikola.com/'
license=('custom')
depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
         'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
         'python-yapsy' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
         'python-blinker' 'python-colorama' 'python-natsort')
makedepends=('git')
options=(!emptydirs)
provides=('python-nikola')
conflicts=('python-nikola' 'python2-nikola' 'python2-nikola-git')
source=("git://github.com/getnikola/${_gitname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

# vim:set ts=2 sw=2 et:
