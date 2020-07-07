# Maintainer: Librewish <librewish@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
pkgname=thedarkmod
pkgver=2.08
pkgrel=1
pkgdesc="Thief style universe using idTech4"
arch=('x86_64')
url="https://www.thedarkmod.com"
license=('Boost' 'BSD' 'CCPL' 'GPL' 'GPL3' 'custom:curl')
depends=('glibc' 'libx11' 'libxxf86vm' 'sh')
makedepends=('cmake' 'systemd')
install="$pkgname.install"
source=("https://www.thedarkmod.com/sources/$pkgname.$pkgver.src.7z"
        "$pkgname.desktop"
        "$pkgname.png"
        "$pkgname.sh")
noextract=("$pkgname.$pkgver.src.7z")

# Choose one of the mirrors from http://mirrors.thedarkmod.com/tdm_mirrors.txt
_mirror='https://darkmod.taaaki.za.net/release'

# The list of game assets can be obtained by running the command
# curl -s "$_mirror/crc_info.txt" | awk -F ' |]' '/\[File .*pk4\]/ { print "         '\''" $2 "'\''" }'
_assets=('fms/newjob/newjob.pk4'
         'fms/stlucia/stlucia.pk4'
         'fms/training_mission/training_mission.pk4'
         'tdm_ai_animals01.pk4'
         'tdm_ai_base01.pk4'
         'tdm_ai_humanoid_beasts01.pk4'
         'tdm_ai_humanoid_beasts02.pk4'
         'tdm_ai_humanoid_builders01.pk4'
         'tdm_ai_humanoid_females01.pk4'
         'tdm_ai_humanoid_guards01.pk4'
         'tdm_ai_humanoid_heads01.pk4'
         'tdm_ai_humanoid_mages01.pk4'
         'tdm_ai_humanoid_nobles01.pk4'
         'tdm_ai_humanoid_pagans01.pk4'
         'tdm_ai_humanoid_townsfolk01.pk4'
         'tdm_ai_humanoid_undead01.pk4'
         'tdm_ai_monsters_spiders01.pk4'
         'tdm_ai_steambots01.pk4'
         'tdm_base01.pk4'
         'tdm_defs01.pk4'
         'tdm_env01.pk4'
         'tdm_fonts01.pk4'
         'tdm_gui01.pk4'
         'tdm_gui_credits01.pk4'
         'tdm_models01.pk4'
         'tdm_models02.pk4'
         'tdm_models_decls01.pk4'
         'tdm_player01.pk4'
         'tdm_prefabs01.pk4'
         'tdm_sound_ambient01.pk4'
         'tdm_sound_ambient02.pk4'
         'tdm_sound_ambient03.pk4'
         'tdm_sound_ambient_decls01.pk4'
         'tdm_sound_sfx01.pk4'
         'tdm_sound_sfx02.pk4'
         'tdm_sound_vocals01.pk4'
         'tdm_sound_vocals02.pk4'
         'tdm_sound_vocals03.pk4'
         'tdm_sound_vocals04.pk4'
         'tdm_sound_vocals05.pk4'
         'tdm_sound_vocals06.pk4'
         'tdm_sound_vocals07.pk4'
         'tdm_sound_vocals_decls01.pk4'
         'tdm_standalone.pk4'
         'tdm_textures_base01.pk4'
         'tdm_textures_carpet01.pk4'
         'tdm_textures_decals01.pk4'
         'tdm_textures_door01.pk4'
         'tdm_textures_fabric01.pk4'
         'tdm_textures_glass01.pk4'
         'tdm_textures_metal01.pk4'
         'tdm_textures_nature01.pk4'
         'tdm_textures_other01.pk4'
         'tdm_textures_paint_paper01.pk4'
         'tdm_textures_plaster01.pk4'
         'tdm_textures_roof01.pk4'
         'tdm_textures_sfx01.pk4'
         'tdm_textures_stone_brick01.pk4'
         'tdm_textures_stone_cobblestones01.pk4'
         'tdm_textures_stone_flat01.pk4'
         'tdm_textures_stone_natural01.pk4'
         'tdm_textures_stone_sculpted01.pk4'
         'tdm_textures_window01.pk4'
         'tdm_textures_wood01.pk4')

for _asset in "${_assets[@]}"
do
	source+=("$pkgname-$pkgver-${_asset##*/}::${_asset/#/$_mirror/}")
	noextract+=("$pkgname-$pkgver-${_asset##*/}")
done

sha256sums=('fa96efd39320daa95eace9e9e481a37b4dc97ce6ecf46be1a9031b6de401bb2e'
            '003910643fe004d2bd9c2567c394013e97885a21a00da19d95ebd92ffc44b743'
            '46b389ee44e86fb67e9013e0d22c794c2398b4a9a0addac874136f6b85d6210b'
            'f3b29d350be5efc48ec9c967a6f830f8e2212af2648e9732b0e4082b5275df6c'
            'e792344c1db41d1761de76905c39bb99820014e22e99fd486d9cc73acdd28173'
            'faa0d65c2345b018657fc7295a52cdc350651f10c2a086de35feaa9354c3aa53'
            'd30ac530ff1076c7923c695110e842173b9c705c8f01f91fc1ede6fc6f0023ab'
            '6f8ff8914beb5e42f8afb13c8bc1e9d2b005614dfad8402bc8f71d6eb50aca0c'
            '843e66d388d2324c0e1680724479018b9c6d32d2d709567a6c915ca208937db0'
            '970c7f3376c389684dc1d6878a628319ec926a1ac70095d58b22bceb79d6f1fd'
            '5bfe04c26b3fd8e194e7ed2d7a1e22a5f15f85c82c4bcdaef2eed1e042168ac8'
            'f9077040dbdb5db5ca1ab7201f8b78d142cd655343bc9b281cfc99d7dfb47ea2'
            '7d6e739c41029254387eea97b96222b25ba338ded05499e3184b3942ddd3fc50'
            'a0b7b59bf1ac557487c5f4c7eec1ec2c929f1a8e91fe672a9118da8cdb13857b'
            '81b99505863d1d17e500ef34776bcd4f0489ae9473f881d16fa7e55959647522'
            '82c352b9121735e752069446dad686537c5014a86c08e28263a32f6ac42e8d11'
            '0df25c3bc1f6a9e524d5cb21b8486b93df1c04b83756e77d04baf580619e2667'
            '4ee53b3bf172765477d72b7ebaad347983d6bddfdc65ca30b6e5171e32bcf565'
            'ba0cc680173efa86d34a361cb8a4fc73da893cad8b6796dbed343589eeceb91a'
            '6535897ad82c4305af555d57894f3039ee399535c87ecf3c3cb7dc271b7cdcaf'
            'd78628bcc97f9e1f987b563d30efe59b140c6a48afca5b700b83eaf961029742'
            '7f4e495bf7eef20f1855c705650b281fb3653b46f49b36cea457c1c8a827c162'
            '77da9e44be7aca7a45463333dbc83597dff37aa6c154397dba91061f55fca645'
            '90c01d89cdd88df1b204a5ebbab69e67667ddaec03f587906460cd183eec8070'
            'dfb5b5ad516127c0bb89acf2ed44cb39cd146c4e7ce3ebfefc8b3bd3075fad42'
            '4b6e4d5f097d07e4ae38ccce917f5857d050c493b382f40c09986944716def7b'
            '642e55fcc164b3a66df4e9f43fb7f06ccc4a93b5bec1aa8c31a6d1e2a471bfe6'
            'a5e0ec44d2d7bb48a3c9b14ce91b07b42a6903f9bc8011d6ef153984e4a5ff93'
            '82847b573e6ae39ed3a5e6b5025efb52f099b8f9bbc65186ecc68416b06e31a1'
            '01b0e224a0cd1afb7dfdfaa3890b8930b146a2bd0dc5270e96d44b9fc72a597e'
            '8b27d3cb7fd90befbfcc23342084ee8e538279c6e73dea591f88ef64fbae8cc1'
            '6c448f0210266ca094e339bd6aa2885613da4978d02370184b8a9319de300ace'
            'f62bf7e07f8c7e1f44eb4ed0a65be13e0746aded546c2d09d7ca135271092fb0'
            '03cfd949f86ff23e02cc9703c5de51de2a9a3df706ce56de3c757dae5caa9d21'
            'bc1a1d6082d8fe7576e513502375b09edeae11b23d456b8623015b61c1ba2c9b'
            '6b271ecd0f62b65381e2d02387bf9745abe03d936621a4719409263e5226287a'
            'bc98076517863997bf994eecf106c6074776550efe34806c1d7bcc8355728062'
            '1ea5df20f07d75b8039a831cf57963b0d18669fe99a7654b9d0b7b24e5222094'
            '6cacb7ccd1ee1c0a54908dfc134ffe93140039712c1b0030203c247b193bdc12'
            '49b76b3957e9815f37308c5f433252f61d64d361482a609054edc12edfc9c4a5'
            '9be8aa1fce10d69051949b13cf1e58edf16bb1287456d9670aa3257f0820d118'
            'e6b391aee85668fc1809bfdc65f5c72b3f03ef10dcfc18894bed782363f4ec76'
            'e6a4bb1b39fa9e756797f6355aba89de53b1f32c2e98c9954b04fb73d01688d7'
            'ea7466a0fcff2e1f84baac4a0db0e9133f8e555ce8e0c3f14f767842853ee381'
            'ee3f39d613991d4b3dd1d3fbd6e128e3bfaa84e4acb42ac97c350d7498b88b2c'
            'aea2f8d0e3ae3539a3b441c680576a55852e7119b4b0acd177b677b0a1c0f6e0'
            '9e89e6736f979fbd16e81dc22b7dd41a4cece59560a8e7bbb70aa16e269d98d6'
            '95faf38339b6532d4662c1a0dc135e9b92966cfdff3b3820fc69be6834744c9b'
            'e9d47eec05bfe52bd93bc194284aef1da0b2d8fc7f17698cb8d031882356f760'
            'b70044985005d2976fab3273d14bde4d423007d39b9b1f57e70101d17de1a6ce'
            '49f1f396274efc08b65ffc6240584bee0b481a277b5d7f02d26d90652e649335'
            '82b2b93a24ca876f41f03ce7ae540c94cbf58f17eae9b14798f46f6991cf7f9a'
            '15d59954f0d557cb479daa68f255328f6977f4010dbf48721a0ddb13069be894'
            '7ad7c4894f279245ac2c6f6d36e615f59eb5a9ff1381c00ab71396a04fb74d40'
            '8a24a691f97e9d0b8da02920dce41cb0b1123a0891e20a0a65fa7c77a448ff74'
            '409e85aa70d03836ce0482fd80268f31b6d09261aa817409e12c898f4b42d7b6'
            '145e64d8ee835d94163d8b82716d39718700d72645ceed7c22150402cd32bc69'
            'aef6f9ffb9f1147004921f968c46c13b9feb637a1c5996290f419e1b39063476'
            '114d009fa2f481e7bb796f4148e7f4ce1f5fba33bbb44c1e6ead9ae5a45b052a'
            '41a35249f6777aab34985cb7bbc92b61ccfbe3549450b54288db914853b85365'
            '3f4dc9b2f28ff30b52e52502be24d01bf6375c42b3ab8d9edb0ecc69fccba2af'
            '4198ef5fa5937074de285cb140775bd013239f75517df2c89cd7ad4ddab858ca'
            '60c228f0959bdb69af38444c48ff4b1faaa187b39de80ade9550a88e811362ed'
            'e46f5b77da71a04fab0da75b0aa0a75f34d9506f8d49b58bf06fc852b7fd7494'
            'a092d012d47d7188740a1d3ca3f4882a726463bb976ee060e7defd3a3e9cd03a'
            '54613aff0c44ed98e75065d420c45a24dfa90af347771b0c8d70ff4a9abf638f'
            'cd39672dcc7f34f2e4dfa03b3bde51f790e18fb8cd3479f467fc94ac92bf9f5e'
            '5a433c18df1c3b6bd209192ea229f0e4eb262b96d97243cb2fdbcaf837956764')

prepare() {
	mkdir -p darkmod
	bsdtar -xvf "$pkgname.$pkgver.src.7z" -C darkmod
}

build() {
	cd darkmod
	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUCM_UNITY_BUILD=ON \
		-Wno-dev
	make -C build
}

package() {
	install -Dm755 "darkmod/$pkgname.x64" -t "$pkgdir/opt/$pkgname"
	install -Dm644 darkmod/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"

	for _asset in "${_assets[@]}"; do
		install -Dm644 "$pkgname-$pkgver-${_asset##*/}" "$pkgdir/opt/$pkgname/$_asset"
	done

	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	# Users must be able to create files in the game directory to save games,
	# install new missions etc, cf. https://bugs.thedarkmod.com/view.php?id=3567
	chown root:games "$pkgdir/opt/$pkgname"/{,fms,fms/newjob,fms/stlucia,fms/training_mission}
	chmod g+w "$pkgdir/opt/$pkgname"/{,fms,fms/newjob,fms/stlucia,fms/training_mission}
}
