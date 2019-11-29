# Maintainer: Peter Sutton <foxxy(at)foxdogstudios(dot)com>
# Contributor: Daniele Paolella <danielepaolella(at)email(dot)it>
# Contributor: Artem Borisovskiy

pkgname=hydrogen-drumkits
pkgver=20191129
pkgrel=1
pkgdesc='Hydrogen drum kits'
arch=(any)
url='https://sourceforge.net/projects/hydrogen/'
license=('GPL2')
depends=(hydrogen)
changelog=ChangeLog

_drumkits=(
    '3355606kit'
    'BJA_Pacific'
    'Boss_DR-110'
    'Classic-626'
    'Classic-808'
    'ColomboAcousticDrumkit'
    'DeathMetal'
    'EasternHop-1'
    'ElectricEmpireKit'
    'ErnysPercussion'
    'ForzeeStereo'
    # 'Gimme A Hand 1.0'
    'HardElectro1'
    'HipHop-1'
    'HipHop-2'
    'K-27_Trash_Kit'
    'Lightning1024'
    'Millo-Drums_v.1'
    'Millo_MultiLayered2'
    'Millo_MultiLayered3'
    'SF3007-2011-Set-03'
    'Synthie-1'
    'TD-7kit'
    'TR808909'
    'Techno-1'
    'The Black Pearl 1.0'
    'VariBreaks'
    'YamahaVintageKit'
    'circAfrique v4'
)

_subhost='netcologne'
_host="https://$_subhost.dl.sourceforge.net"
_path='/project/hydrogen/Sound Libraries/Main sound libraries'
_base=$_host$_path

for _drumkit in "${_drumkits[@]}"; do
    source+=( "$_base/$_drumkit.h2drumkit" )
done

sha256sums=(
    '96b1d325fd52e97d7b99ca9191cb376e430ecea1f83d12281f314e30f20fa121'
    'a485753a2a60a1ce30e782784c0f26a84bbbee6bdb324b40c04a1f09f3668305'
    '5debdfb050f639478725af134d315649f242142f84691ce1409cd9f56f6943be'
    '3e95845d821129b119dea47fd56eadbb17da74b3a95a2154cac31a037b8a6f66'
    '6be9d2dba736bfcbc85e31ecf744c74b6620143e4fdc198309c4786951077391'
    '30d30e6c9aeb25597454034cee58495b410a8f95b3d689c9a0c4e2915af7871f'
    '7ae4f8e7bf52b84637100b6f781e94752ad738626cff912c7704522ea692fbe7'
    '14ed0cd45097471e3f9775958f40441c1c2886d5594e0111e2b0b7e63b5da00f'
    '7229f52268483119c3a8b1e62dc85f801e37b6c34834e8c603d8aaec0445c5f9'
    'daccb09332bf6aac09b83f9605a084120a9decff1447d02cc68d16b00f101546'
    '37b9f1d6d8fdf2a65aef5fcde5ac305c89983e1e23ce5b8194922640cce9146d'
    # '77285a6bf6b12684a8b38ea7d2850e7be9f0c8102101f4eb74b92cc08a5f023d'
    'cfde7e4c7a25f0d72d0674b4d849471b9d309e28372709b509e743aad8c30d5c'
    'd194d2d47cd33d09842ecb6db74783aaa89368e69a964868c7fd2feb3e1b7613'
    'e2c586017bc4952976b8af5447435e7fa5109308861b5f5be3213d86346bd972'
    'ad88e46d6e07a046cb5443e5bea4cc7645be992fc85e24853372cf5562c5ee24'
    'f41377b32b154c809984e11ebaf0b7cfd9bac2ecc26b78c8de7c9bbd243f9310'
    'c43d5b25938e95bcce4a204892e668b289f419b993e006bdf3f28c9c374b10c9'
    'c81cebee6a4d0df70fee7456c13bbdfe2c50b39b62888cb03c0768f885eb74dd'
    '5927572af24f9a2737f94c7c8e816e22d6b28f00e19d575495c1a97351a79096'
    'cffa12c5a176d9c9532bafacba773c0a0f7e2fe71ea5a14dae402d2de0726ccb'
    'adcc4a3023708fab46108acfc99dfc04e2b2b62bb21aa87ed8a027ccbb46b576'
    '4e9400c2bb7d06f0271bcbf2e052235fe8500095d6e6dfcd8fcb0593571f110b'
    '4637f0c39b488074943030d6cb0274f3e35d1da221eb6d078c15ea118f4e496d'
    '83e072ef8e8783d861ce500a8082161392e49853a54335823e1cd7f7874c8504'
    '4fb52d1bbdda886db4b742c6de33d7475ef5088076c18533bd705c588f69a87b'
    'ed7bfa21abc05712ea89860b7e680808d14d567d49377fbc65914a9dd518e14d'
    '17005f5c79d92af3caef52ea313b1ac5bc49f1eefa4462b22980dec2b031bf27'
    'f09ff7e46310409b8ec7f180193cda6bb69e2a67d5e7f78f8c1c1954bb9a3a2c'
)

package() {
    local _drumkitsdir="$pkgdir/usr/share/hydrogen/data/drumkits"
    install -d "$_drumkitsdir"
    cp -a "${_drumkits[@]}" "$_drumkitsdir"
    find "$_drumkitsdir" -type d -exec chmod 755 {} \;
    find "$_drumkitsdir" -type f -exec chmod 644 {} \;
}
