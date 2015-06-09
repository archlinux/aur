# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_ver='0ubuntu6.5.2~trusty0'

pkgname=skype-wrapper
pkgver=${_ver/\~/.}
pkgrel=1
pkgdesc="Integrate Skype with Unity"
arch=(any)
url="https://launchpad.net/~skype-wrapper/+archive/ppa"
license=(GPL)
depends=(gtk2 libindicate pygtk python2-dbus python2-gobject python2-pillow
         python2-wnck skype skype4py)
install=skype-wrapper.install
source=("http://ppa.launchpad.net/skype-wrapper/ppa/ubuntu/pool/main/s/skype-wrapper/skype-wrapper_${_ver}.tar.gz"
        0001-Use-Python-2.patch)
sha512sums=('c5925cc557322a25f78304b68273c5367ce58703c6061553233984acec76bb887188e3bf1093742f7ce29f0ff80d24395606fae256dda7181fd228b13ed48533'
            '1b2d319a3b3dd2fb967ad7db61f900ed7a029f47025d046fd7769d97b3621391b6f7476b03db9b23e54c9fc593da13838543973d498832180a4c117983f3f13a')

prepare() {
  cd "${pkgname}"
  patch -p1 -i ../0001-Use-Python-2.patch
}

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
