# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: now-im <now.im.627 gmail com>

pkgname=polo-bin
_name=polo-file-manager
_branch=18.8
pkgver=${_branch}.2
_channel=beta
pkgrel=1
pkgdesc="A modern, light-weight GTK file manager for Linux, currently in beta (.deb binary version)"
arch=(i686 x86_64)
url="https://teejee2008.github.io/polo/"
license=(GPL2)
depends=(gtk3 libgee libsoup vte3 rsync gvfs p7zip)
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'rclone: cloud storage accounts support'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=(polo)
conflicts=(polo)
source_i686=("https://github.com/teejee2008/polo/releases/download/v${_branch}-${_channel}/${_name}-v${pkgver}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${_branch}-${_channel}/${_name}-v${pkgver}-amd64.deb")

sha256sums_i686=('ae235d638de83b86d5490553e7e99bbe53b4609f8d99a04babd6047a94aa8b0b')
sha256sums_x86_64=('18e7217e57b9b422af5431ba9eaded1a44775a0781a1dc7abf50ed736bbbdeb4')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
}
