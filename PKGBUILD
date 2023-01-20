# Maintainer: Justin Kromliner <hashworks@archlinux.org>
# Contributor: Dominik Schrempf <dominik.schrempf@gmail.com>

pkgname=nextcloud-systemd-timers
pkgver=0.12.0
pkgrel=1
pkgdesc="Systemd services and timers for Nextcloud background jobs (see Nextcloud Arch Wiki entry)."
arch=('any')
url=""
license=('GPL')
depends=('nextcloud>=25.0.3')
optdepends=('nextcloud-app-previewgenerator: pre-generation of previews')
install=nextcloud-systemd-timers.install
source=("nextcloud-app-update-all.service"
        "nextcloud-app-update-all.timer"
        "nextcloud-files-scan-all.service"
        "nextcloud-files-scan-all.timer"
        "nextcloud-preview-generate-all.service"
        "nextcloud-preview-generate-all.timer"
        "nextcloud-preview-pre-generate.service"
        "nextcloud-preview-pre-generate.timer")
sha256sums=('1bc1a67db2d391c233d3dcee3e7ebf46f12652cba35fd02a5b5f03c8bd531bec'
            '39039f1a3dc23022fccc991daca86d77e7d41be275566f6892cd6b290fa0da4a'
            'b84fe79358b3f183a5207907cf3af22bb7e3ab1f53a36007a74bc4d061351a67'
            '2f191059b619141ba883ae132af56460212c84eb208f087b87b79b0a3b9e4900'
            '1a61dc1332e4af76229d54288ae62c2221a9162674e8a138a92be36410cad935'
            'bd4bbd01a9d68e0217c3b48c977dda881fd956b53f981a6e32af0357d2e0b716'
            'ceafc82931c82fddfe5354d6821b04610021884bf53d903b25c51a66fcd83cc1'
            '56e3cab181040101be05d4b7723825f7b0c082c34403e42c6f0934c6474a6a43')

package() {
        install -D -t $pkgdir/usr/lib/systemd/system -m 644 \
                nextcloud-app-update-all.service \
                nextcloud-app-update-all.timer \
                nextcloud-files-scan-all.service \
                nextcloud-files-scan-all.timer \
                nextcloud-preview-generate-all.service \
                nextcloud-preview-generate-all.timer \
                nextcloud-preview-pre-generate.service \
                nextcloud-preview-pre-generate.timer
}

# vim:set ts=2 sw=2 et:
