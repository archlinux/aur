pkgname=(
  'pacman-hooks-ghmeta'
  'pacman-hook-sync'
  'pacman-hook-zsh'
  'pacman-hook-remove-locales'
  'pacman-hook-remove-headers'
  'pacman-hook-remove-documentation'
  'pacman-hook-optimize-images'
  'pacman-hook-cleanup'
  )
pkgver=1.01
pkgrel=1
pkgdesc="Pacman hooks metapackage"
arch=('any')
url='https://github.com/grigorii-horos/breeze-icons-extra'
license=('LGPL')

source=()
sha256sums=()

prepare () {
  true
}

build () {
  true
}

package_pacman-hooks-ghmeta() {
  optdepends=(
    'pacman-hook-sync: Pacman hook who will sync all filesystems'
    'pacman-hook-zsh: Pacman hook who will optimize zsh scripts'
    'pacman-hook-remove-locales: Pacman hook who will remove unuseful locales'
    'pacman-hook-remove-headers: Pacman hook who will remove headers'
    'pacman-hook-remove-documentation: Pacman hook who will remove documentation'
    'pacman-hook-optimize-images: Pacman hook who will optimize all images in package'
    'pacman-hook-cleanup: Pacman hook who will remove old packages from cache'
  )
}

package_pacman-hook-sync() {
  mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
  install ../zzz-sync.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-zsh() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/" "$pkgdir/usr/share/libalpm/hooks/"
  install ../zsh "$pkgdir/usr/share/libalpm/scripts/"
  install ../90-zsh.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-remove-locales() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/" "$pkgdir/usr/share/libalpm/hooks/"
  install ../remove-locales "$pkgdir/usr/share/libalpm/scripts/"
  install ../10-remove-locales.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-remove-headers() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/" "$pkgdir/usr/share/libalpm/hooks/"
  install ../remove-headers "$pkgdir/usr/share/libalpm/scripts/"
  install ../10-remove-headers.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-remove-documentation() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/" "$pkgdir/usr/share/libalpm/hooks/"
  install ../remove-documentation "$pkgdir/usr/share/libalpm/scripts/"
  install ../10-remove-documentation.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-optimize-images() {
  mkdir -p "$pkgdir/usr/share/libalpm/scripts/" "$pkgdir/usr/share/libalpm/hooks/"
  install ../optimize-images "$pkgdir/usr/share/libalpm/scripts/"
  install ../90-optimize-images.hook "$pkgdir/usr/share/libalpm/hooks/"
}

package_pacman-hook-cleanup() {
  mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
  install ../zzz-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/"
}
