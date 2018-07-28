# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view'
         'python-buildbot-console-view' 'python-buildbot-grid-view' 'python-buildbot-wsgi-dashboards'
         )
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view' 'buildbot_grid_view' 'buildbot_wsgi_dashboards')
pkgver=1.3.0
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
  'afd90c823463a5d3e318123c5b4af83d22b0ad2ba93043c3635100419ee1ceb9'
  'eac3c1a618bcc5892ca1ed49c179f8fbbefd96d51f5066ee30ba0ac9a87c3c9c'
  '2805f0560bebc44cacee4ef3c5ee4d63136820a119f0660e51ba6b3a25c42d1e'
  '69fc72d498c7e4407534bbd88c2b7dce9d5fd5f66f68010454613271be374491'
  '0032798de53edf2bbd3baf1cb25b2dc80ba039fa02588d5a1d6aecce623b2ace'
  'bc7cc23c123bd5425b2211158b42b8234886ee72394015abf16c43412f5ebb6c'
  'a42951149145821deb3532113cfd1f270d612a1c68bee05935e24c9a5b953d8f'
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
