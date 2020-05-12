# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=youdao-dict
pkgver=6.0.0
pkgrel=3
pkgdesc='YouDao Dictionary'
arch=('i686' 'x86_64')
url='https://cidian.youdao.com/'
license=('GPL3')
depends=(
	'hicolor-icon-theme'
	
	'python-pyqt5'
	'python-requests'
	'python-xlib'
	'python-gobject'
	'python-opengl'
	'python-pillow'
	'python-pyquery'
	'python-webob'
	'python-xdg'
	
	'tesseract-data-eng'
	'tesseract-data-chi_tra'
	'tesseract-data-chi_sim'
	'qt5-webkit'
	'qt5-graphicaleffects'
	'qt5-quickcontrols'
	'qt5-multimedia'
)
source_i686=('http://codown.youdao.com/cidian/linux/youdao-dict_6.0.0_i386.tar.gz')
source_x86_64=('http://codown.youdao.com/cidian/linux/youdao-dict-6.0.0-amd64.tar.gz')
sha256sums_i686=('d1ff404f1e465d6a196b566294ddfea1a1bfe4568226201b65d74236407152fc')
sha256sums_x86_64=('556e2dadd0a737967b78ffd9ad5430660d190e4489854a309c85f81fdf7f084f')

package() {
	cd "${srcdir}"
	[ ${CARCH} == x86_64 ] && cd "youdao-dict-${pkgver}-amd64"
	
	sed -i -e "/PREFIX=/cROOT=${pkgdir}\nPREFIX=\$ROOT/usr" -e 's/\/etc/$ROOT\/etc/g' -e 's/ln -sf $PREFIX/ln -sf \/usr/g' install.sh
	sh install.sh
}


