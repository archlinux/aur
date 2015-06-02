# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=backup-tube
pkgver=0.22
pkgrel=1
pkgdesc="Backup all videos in a YouTube channel by providing the ID of the user you wish to backup."
url="https://code.google.com/p/backup-tube/"
license=('MIT')
arch=('any')
depends=('java-runtime')
source=("https://backup-tube.googlecode.com/files/${pkgname}.cmd.${pkgver}.zip"
        "${pkgname}.sh")
md5sums=('ad54fb7a2baaafb4f44b97fa9be3507c'
         '349c20e392dbc6959878f4ecd7c6eb3b')

_destdir="/usr/share/java/${pkgname}"

package() {
  cd $srcdir/dist/
  
  mkdir -p $pkgdir/$_destdir
  cp -r . $pkgdir/$_destdir

  install -Dm755 $srcdir/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
