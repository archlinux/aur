# Maintainer: Dory <dory@dory.moe>
_pkgname=discord-ext-voice-recv
_srcname=discord_ext_voice_recv
pkgname=python-discord-ext-voice-recv
pkgver=0.5.2a179
pkgrel=1
pkgdesc="Experimental voice receive extension for discord.py"
arch=('any')
url="https://github.com/imayhaveborkedit/discord-ext-voice-recv"
license=('MIT')
depends=('python' 'python-discord>=2.5' 'python-pynacl')
makedepends=('python-installer')
source=("${_srcname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/bc/65/d3a9d555cb2baaab6f8081d64d4d423688ba28ff7ae6608c374d06add3f6/${_srcname}-${pkgver}-py3-none-any.whl")
noextract=("${_srcname}-${pkgver}-py3-none-any.whl")
sha256sums=('f3fa65f2c1591bef2382aa39f3ebc25d6751b405aef5b5d113dfb452640f29fc')

package() {
    python -m installer --destdir="$pkgdir" "${_srcname}-${pkgver}-py3-none-any.whl"

    # Extract license from wheel
    bsdtar -xf "${_srcname}-${pkgver}-py3-none-any.whl" "${_srcname}-${pkgver}.dist-info/licenses/LICENSE"
    install -Dm644 "${_srcname}-${pkgver}.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
