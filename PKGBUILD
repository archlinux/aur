# Author: Micah Elliott <mde@MicahElliott.com>
# package guidelines: https://wiki.archlinux.org/index.php/VCS_package_guidelines

pkgname=flickpapr-git
_pkgname=flickpapr
pkgver=r21.9b91c11
pkgrel=1
pkgdesc='randomly choose an “interesting” flickr photo for desktop wallpaper'
arch=('any')
url='https://github.com/MicahElliott/flickpapr'
license=('WTFPL')
depends=('zsh' 'ruby' 'ruby-nokogiri' 'libnotify' 'feh' 'imagemagick' 'daemonize' 'dunst')
provides=($_pkgname=$pkgver)
makedepends=('git')
source=('git://github.com/MicahElliott/flickpapr.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -Dm755 bin/flickpapr $pkgdir/usr/bin/flickpapr
  install -Dm755 bin/flickloop $pkgdir/usr/bin/flickloop
  install -Dm755 bin/flickd    $pkgdir/usr/bin/flickd
  install -Dm755 share/flickpapr/flickr-icon-64.png    $pkgdir/usr/share/flickpapr/flickr-icon-64.png
  install -Dm755 share/flickpapr/flickr-icon-bw-64.png $pkgdir/usr/share/flickpapr/flickr-icon-bw-64.png 
}

# vim:set ts=2 sw=2 et:
