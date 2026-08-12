# Maintainer: chadsr <git at ross dot ch>
# Contributor: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Carson Rueter <roachh at proton mail dot com>

pkgname=vscodium-features
# this version is equvalent of code-features 1.119.0-1
pkgver=1.119.0
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('0BSD')
depends=('vscodium' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
install="${pkgname}.install"
source=("${pkgname}.hook"
	'patch.py'
	'patch.json')
b2sums=('030b9c51c84c24b83f5a97a2df9a5ea2da8e80bfd3a8631d661bd75274ada39e3289bf68c0165b89c41d7137b14f39f3077dab1905522cb3484c08a35492d5f8'
	'd14fcf9b8890f218c5d76d513afebcff7dd1046fb9e1db7fafaac9d66a76344b4d88aa952ff914e6eb0583706e5aa3fb048092fbabb71c02ef7290dfac4c8984'
	'469cdb421973b2eb40f1e565ec882a03c407436bb407ac16ebee7565b4ff7c7289ce082c95cba005abd7ce843479374249d3a5f91755101a18e00200db291bab')

package() {
	install -Dm644 ${pkgname}.hook "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
	install -Dm755 patch.py "${pkgdir}/usr/share/${pkgname}/patch.py"
	install -Dm644 patch.json "${pkgdir}/usr/share/${pkgname}/patch.json"
}
