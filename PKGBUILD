# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view'
         'python-buildbot-console-view' 'python-buildbot-grid-view' 'python-buildbot-wsgi-dashboards'
         )
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view' 'buildbot_grid_view' 'buildbot_wsgi_dashboards')
pkgver=1.1.1
pkgrel=1
arch=('any')
url="http://buildbot.net"
license=("GPL")
makedepends=('python-pip' 
             'python-twisted' 'python-jinja' 'python-sqlalchemy-migrate' 'python-dateutil' 'python-sqlparse' 'python-pyjwt' 'python-autobahn' 'python-txaio'
             'python-future' 'python-zope-interface' 'python-tempita'
             'python-distro'
             )
source=(
  "https://files.pythonhosted.org/packages/py2.py3/${_names[0]::1}/${_names[0]}/${_names[0]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[1]::1}/${_names[1]}/${_names[1]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[2]::1}/${_names[2]}/${_names[2]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[3]::1}/${_names[3]}/${_names[3]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[4]::1}/${_names[4]}/${_names[4]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[5]::1}/${_names[5]}/${_names[5]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[6]::1}/${_names[6]}/${_names[6]}-$pkgver-py2.py3-none-any.whl"
)
sha256sums=(
  'b00a924934e8ec7e15ceda9ab699a336517b8ad61e1ac9b5bedf5027762eb209'
  '6b7f77a7942b7f06e43a669263213f5df528ad726735f36be6cee0e423e26907'
  '7722b0bb18d092abb5c4f17c0655d7cc7e53155ddcf762bd4922c8c382e84b1d'
  '81d5b79bd353aa0df0ea1e972f904dfa0d511f7284a87dc5206a9e30a25c35b2'
  '6112afddf63d5f524e54d6358045d731dc95a821059d519d277a7a7048dee045'
  'ba316eeb27e4074928250529d1932a0473f6d98fbce742ea07404a7159325aab'
  '3420b6fa8983afc21119848d73b3d197cfbd070804904ccf7f2b6d25b992c5eb'
)

package_buildbot() {
  python="python"
  depends=('python-twisted' 'python-jinja' 'python-sqlalchemy-migrate' 'python-dateutil' 'python-sqlparse' 'python-pyjwt' 'python-autobahn' 'python-txaio'
           'python-future' 'python-zope-interface' 'python-tempita'
           'python-distro')
  pkgdesc="The Continuous Integration Framework"
  _name=${_names[0]}
  extraver="-py2.py3"
  install_whl
}

package_python-buildbot-www() {
  python="python"
  depends=('buildbot')
  pkgdesc="Buildbot UI"
  _name=${_names[1]}
  extraver="-py2.py3"
  install_whl
}

package_buildbot-worker() {
  python="python"
  pkgdesc="Buildbot Worker Daemon"
  depends=('python-twisted' 'python-future')
  _name=${_names[2]}
  extraver="-py2.py3"
  install_whl
}

package_python-buildbot-waterfall-view() {
  python="python"
  depends=('buildbot')
  pkgdesc="Buildbot Waterfall View plugin"
  _name=${_names[3]}
  extraver="-py2.py3"
  install_whl
}

package_python-buildbot-console-view() {
  python="python"
  depends=('buildbot')
  pkgdesc="Buildbot Console View plugin"
  _name=${_names[4]}
  extraver="-py2.py3"
  install_whl
}

package_python-buildbot-grid-view() {
  python="python"
  depends=('buildbot')
  pkgdesc="Buildbot Grid View plugin"
  _name=${_names[5]}
  extraver="-py2.py3"
  install_whl
}

package_python-buildbot-wsgi-dashboards() {
  python="python"
  depends=('buildbot')
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"
  _name=${_names[6]}
  extraver="-py2.py3"
  install_whl
}

install_whl() {
  # install
  PIP_CONFIG_FILE=/dev/null $python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name}-$pkgver$extraver-none-any.whl"
  # generate .pyo
  $python -O -m compileall ${pkgdir}
}
