# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=osintdb-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='An OSINT ressource collection manager'
arch=('x86_64')
url="https://github.com/theosintguy/osintdb"
license=('MIT')
depends=('libobjectbox')
provides=("osintdb")
conflicts=("osintdb-git")
source=("https://github.com/theosintguy/osintdb/releases/download/${pkgver}/osintdb"
        "https://github.com/theosintguy/osintdb/releases/download/${pkgver}/tools.min.json"
        "osintdb.desktop")
sha256sums=('9cd69159938f2fa01658ff93ac09d7592ae076def6444190b16d45b331db84b6'
            'b8817fbef105cd14ebc21e835d0c1f394b0f854973f59ac2a572e4fbe004c274'
            'cfee7e4dba6b574877a3f3ca5adad94a5895d60b7043231d27fd1530e6e34666')

package() {
    install -Dm755 osintdb "${pkgdir}/opt/osintdb/osintdb"
    install -Dm644 osintdb.desktop "${pkgdir}/usr/share/applications/osintdb.desktop"
    install -Dm644 tools.min.json "${pkgdir}/opt/osintdb/tools.min.json"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/osintdb/osintdb "${pkgdir}/usr/bin/osintdb"
}
