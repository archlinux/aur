# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view'
         'python-buildbot-console-view' 'python-buildbot-grid-view' 'python-buildbot-wsgi-dashboards'
         )
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view' 'buildbot_grid_view' 'buildbot_wsgi_dashboards')
pkgver=0.9.15
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
md5sums=(
  '98fb2268ee1533c4f9304a256ae2593f'
  'dba3101ce252f808f0fe44f60b491e5c'
  '6c83ef96923f72954d37594293604169'
  'd7db1a4c3db8798c9c67904f650fb4fa'
  'e28f2d324dcfb9e22496590030592bbd'
  'f1e2a5555e83b0e7c71a32c7e9c7902d'
  '88e708731ecdbb00b5dc8f61fc231205'
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
