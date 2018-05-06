# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-workspaces-compact-applet
pkgver=0.0.0.56e63d6
pkgrel=1
pkgdesc="Compact Workspace Switcher for Budgie Desktop"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dgaw/budgie-workspaces-compact"
depends=('budgie-desktop' 'libwnck3' 'python' 'python-gobject')

_commit='56e63d65ccd5bd8da38608d3d895e56e4187e0d5'
source=("${pkgname}::git+https://github.com/dgaw/budgie-workspaces-compact.git#commit=${_commit}")
sha512sums=('SKIP')

package() {
  _srcdir="${srcdir}/${pkgname}/src/workspaces-compact-applet"
  _plugin_dir="${pkgdir}/usr/lib/budgie-desktop/plugins/workspaces-compact-applet"
  install -d "${_plugin_dir}"
  install -D -m644 "${_srcdir}/WorkspacesCompactApplet.plugin" "${_plugin_dir}/WorkspacesCompactApplet.plugin"
  install -D -m644 "${_srcdir}/workspaces_compact.py" "${_plugin_dir}/workspaces_compact.py"
}
