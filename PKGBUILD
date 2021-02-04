# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss-extensions-git
pkgver=1.17.0
pkgrel=1
pkgdesc='all the official FreshRSS extensions'
arch=('any')
url='https://github.com/FreshRSS/Extensions'
license=('AGPL')
depends=('freshrss')
makedepends=('git')
source=("git+https://github.com/FreshRSS/Extensions.git")
sha256sums=('SKIP')


pkgver(){
  cd "Extensions"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}


package() {
  cd "${srcdir}/Extensions"
  install -d "${pkgdir}/usr/share/webapps/freshrss/extensions"

  for extension in {xExtension-CustomCSS,xExtension-CustomJS,xExtension-ImageProxy,xExtension-QuickCollapse,xExtension-ReadingTime,xExtension-ShareByEmail,xExtension-StickyFeeds,xExtension-TTRSS_API,xExtension-TitleWrap} ; do
    cp -r $extension "${pkgdir}"/usr/share/webapps/freshrss/extensions/
  done

}

# vim:set ts=2 sw=2 et:
