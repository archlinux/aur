# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname=edk2-ovmf-macos
pkgver=1
pkgrel=1
pkgdesc="edk2 UEFI firmware with macOS compatibility"
arch=(
	"any"
)
conflicts=(
	"edk2-ovmf-macboot-git"
)
url="https://github.com/foxlet/macOS-Simple-KVM"
license=(
	"custom"
)
source=(
	"https://github.com/foxlet/macOS-Simple-KVM/raw/091ebfddab9702ad487ac6ed06f4a970e1f19293/firmware/OVMF_CODE.fd"
    "OVMF_VARS.fd::https://github.com/foxlet/macOS-Simple-KVM/raw/091ebfddab9702ad487ac6ed06f4a970e1f19293/firmware/OVMF_VARS-1024x768.fd"
)
b2sums=(
	"29d884afab5919cb82edd316bb19aea7da86cb3bee0713f344433b1ed326e189693bd2cb961b1eee1e08612bf471cf606f7405c45169159043ea17beea60d694"
    "07d9a150ec1d3428902375b07f021f52654a26f760c3c04a2c4ae801985c1a2caff76cc87d81448193b60a93df433f6c52aeb619513a09f96002260208bf10bb"
)

package()
{
	install -D -m644 OVMF_CODE.fd "$pkgdir/usr/share/edk2-ovmf-macboot/x64/OVMF_CODE.fd"
    install -D -m644 OVMF_VARS.fd "$pkgdir/usr/share/edk2-ovmf-macboot/x64/OVMF_VARS.fd"

    ln -s "$pkgdir/usr/share/edk2-ovmf-macboot" "$pkgdir/usr/share/ovmf-macboot"
}
