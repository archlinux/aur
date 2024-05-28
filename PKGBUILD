# Maintainer: Matthew Weger <matthew.d.weger@gmail.com>
pkgname=auto_facelock
pkgver=1.0.6
pkgrel=1
pkgdesc="Face Detection Auto Screen Lock Service"
arch=('any')
license=('MIT')
depends=('python' 'python-opencv' 'python-numpy' 'python-face_recognition' )
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')
install="setup.install"

package() {
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/auto_facelock.py" "$pkgdir/usr/local/bin/auto_facelock.py"
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/auto_facelock_enroll.py" "$pkgdir/usr/local/bin/auto_facelock_enroll.py"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}/auto_facelock@.service" "$pkgdir/etc/systemd/system/auto_facelock@.service"
    install -d "$pkgdir/usr/local/share/known_faces"
}

# Detailed description:
# auto_facelock is a utility that uses face recognition to lock the screen.
# It continuously monitors the webcam and locks the screen if an unrecognized face is detected.
# The tool is useful for enhancing security on personal and shared systems.
# If the Feds snatch your computer like they did to dread pirate roberts you'll be relived to find it locked automatically
