# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view' 'python-buildbot-console-view' 'python-buildbot-grid-view' 'python-buildbot-wsgi-dashboards')
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view' 'buildbot_grid_view' 'buildbot_wsgi_dashboards')
pkgver=0.9.9.post1
pkgrel=1
arch=('any')
url="http://buildbot.net"
license=("GPL")
makedepends=("python-pip")
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
  '4e74a966914178db8320992a86bedde0'
  '65aae565b3ec7d478e8ab9977979976a'
  '55e854bab69a8793db8e4324eebadbcf'
  '4441d4fd901d3adb3e91bc5daace0834'
  'd1da769afd886de31c4de18c3d987c8e'
  '7563f7a8ee845a9bb4d91d8adb4ea886'
  'bf4e8b18343419c61b33f11ee0293b91'
)

package_buildbot() {
  pkgdesc="The Continuous Integration Framework"
  depends=('python-twisted' 'python-jinja' 'python-migrate' 'python-dateutil' 'python-sqlparse' 'python-pyjwt' 'python-autobahn' 'python-txaio'
           'python-future' 'python-zope-interface' 'python-tempita'
           'python-distro')
  _name=${_names[0]}
  install_whl
}

package_python-buildbot-www() {
  pkgdesc="Buildbot UI"
  depends=('buildbot')
  _name=${_names[1]}
  install_whl
}

package_buildbot-worker() {
  pkgdesc="Buildbot Worker Daemon"
  depends=('python-twisted' 'python-future')
  _name=${_names[2]}
  install_whl
}

package_python-buildbot-waterfall-view() {
  pkgdesc="Buildbot Waterfall View plugin"
  depends=('buildbot')
  _name=${_names[3]}
  install_whl
}

package_python-buildbot-console-view() {
  pkgdesc="Buildbot Console View plugin"
  depends=('buildbot')
  _name=${_names[4]}
  install_whl
}

package_python-buildbot-grid-view() {
  pkgdesc="Buildbot Grid View plugin"
  depends=('buildbot')
  _name=${_names[5]}
  install_whl
}

package_python-buildbot-wsgi-dashboards() {
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"
  depends=('buildbot')
  _name=${_names[6]}
  install_whl
}

install_whl() {
  # install
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name}-$pkgver-py2.py3-none-any.whl"
  # generate .pyo
  python -O -m compileall ${pkgdir}
}