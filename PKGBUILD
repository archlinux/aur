# Maintainer: Light <sidus at arbornet.org>

pkgname=poseidon-browser-git
pkgver=r96.a84faf2
pkgrel=1
pkgdesc='A fast, minimal and lightweight browser.'
url='https://sidus-dev.github.io/projects/poseidon/'
arch=('any')
license=('GPL3' 'MIT')
depends=('binutils' 'fakeroot' 'tk' 'python3' 'python-gobject' 'python-decorator' 'python-six' 'python-requests' 'python-pillow' 'python-cairo' 'pyopenssl' 'gtk3' 'gtksourceview3' 'webkit2gtk>=2.12.3')
optdepends=('gst-libav: HTML5 H264 videos support'
            'gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'evince: Embed PDFs support'
            'vte3: Embed terminal support'
            'flashplugin: Adobe Flash Player'
            'icedtea-web: Free web browser plugin to run applets written in Java and an implementation of Java Web Start')
makedepends=('git')
source=("$pkgname::git+https://github.com/sidus-dev/poseidon.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -m755 -d ${pkgdir}/usr/share/applications
  mv -v ${srcdir}/${pkgname}/poseidon.desktop ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/opt
  mv -v ${srcdir}/${pkgname} ${pkgdir}/opt
}
