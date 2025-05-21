# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name0=livekit-agents
_name1=livekit-plugins
_name11=${_name1}-anthropic
_name12=${_name1}-assemblyai
_name13=${_name1}-aws
_name14=${_name1}-azure
_name15=${_name1}-bey
_name16=${_name1}-bithuman
_name17=${_name1}-cartesia
_name18=${_name1}-clova
_name19=${_name1}-deepgram
_name110=${_name1}-elevenlabs
_name111=${_name1}-fal
_name112=${_name1}-gladia
_name113=${_name1}-google
_name114=${_name1}-groq
_name115=${_name1}-hume
_name116=${_name1}-minimal
_name117=${_name1}-neuphonic
_name118=${_name1}-nltk
_name119=${_name1}-openai
_name120=${_name1}-playai
_name121=${_name1}-resemble
_name122=${_name1}-rime
_name123=${_name1}-silero
_name124=${_name1}-speechify
_name125=${_name1}-speechmatics
_name126=${_name1}-tavus
_name127=${_name1}-turn-detector
pkgbase=python-${_name0}
pkgname=(python-${_name0} python-${_name11} python-${_name12} python-${_name13} python-${_name14} python-${_name15} python-${_name16} python-${_name17} python-${_name18} python-${_name19} python-${_name110} python-${_name111} python-${_name112} python-${_name113} python-${_name114} python-${_name115} python-${_name116} python-${_name117} python-${_name118} python-${_name119} python-${_name120} python-${_name121} python-${_name122} python-${_name123} python-${_name124} python-${_name125} python-${_name126} python-${_name127})
pkgver=1.0.22
pkgrel=1
pkgdesc='A powerful framework for building realtime voice AI agents 🤖🎙️📹.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name0}@${pkgver}.tar.gz")
sha256sums=('e18b07268d21fad85482971f3540b8b5c870158f4b7b67bfeacc6e1a7776a384')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-jiwer')

build() {
  for _pkg in "${pkgname[@]}"; do
    if [[ "$_pkg" == *"livekit-plugins"* ]]; then
      cd "${srcdir}"/${_name0//livekit-/}-${_name0}-${pkgver}/${_name1}/${_pkg//python-/}
      python -m build --wheel --no-isolation
    else
      cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}/${_name0}
      python -m build --wheel --no-isolation
    fi
  done
}

# To fix later
#check() {
#  local pytest_options=(
#    -vv
#  )
#  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
#  python -m venv --system-site-packages test-env
#  for _pkg in "${pkgname[@]}"; do
#    if [[ "$_pkg" == *"livekit-plugins"* ]]; then
#      test-env/bin/python -m installer ${_name1}/${_pkg//python-/}/dist/*.whl
#    else
#      test-env/bin/python -m installer ${_name0}/dist/*.whl
#    fi
#  done
#  test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}

package_python-livekit-agents() {
  pkgdesc='LiveKit Python Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-agents'
  depends+=('python-click' 'python-livekit' 'python-livekit-api' 'python-livekit-protocol' 'python-protobuf' 'python-pyjwt' 'python-watchfiles' 'python-psutil' 'python-aiohttp' 'python-typing_extensions' 'python-sounddevice' 'python-docstring-parser' 'python-pydantic')
  optdepends=('python-mcp: mcp'
              'python-av: codecs' 'python-numpy: codecs'
              'python-pillow: images'
              'python-livekit-plugins-aws: aws'
              'python-livekit-plugins-neuphonic: neuphonic'
              'python-livekit-plugins-playai: playai'
              'python-livekit-plugins-turn-detector: turn-detector'
              'python-livekit-plugins-assemblyai: assemblyai'
              'python-livekit-plugins-rime: rime'
              'python-livekit-plugins-nltk: nltk'
              'python-livekit-plugins-anthropic: anthropic'
              'python-livekit-plugins-openai: openai'
              'python-livekit-plugins-groq: groq'
              'python-livekit-plugins-elevenlabs: elevenlabs'
              'python-livekit-plugins-azure: azure'
              'python-livekit-plugins-fal: fal'
              'python-livekit-plugins-clova: clova'
              'python-livekit-plugins-deepgram: deepgram'
              'python-livekit-plugins-silero: silero'
              'python-livekit-plugins-cartesia: cartesia'
              'python-livekit-plugins-speechmatics: speechmatics'
              'python-livekit-plugins-google: google'
              'python-livekit-plugins-gladia: gladia'
              'python-livekit-plugins-resemble: resemble'
              'python-livekit-plugins-bey: bey'
              'python-livekit-plugins-bithuman: bithuman'
              'python-livekit-plugins-speechify: speechify'
              'python-livekit-plugins-tavus: tavus'
              'python-livekit-plugins-hume: hume')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0}/dist/*.whl
}

package_python-livekit-plugins-anthropic() {
  pkgdesc='Agent Framework plugin for services from Anthropic.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-anthropic'
  depends+=('python-livekit-agents' 'python-anthropic')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name11}/dist/*.whl
}

package_python-livekit-plugins-assemblyai() {
  pkgdesc='Agent Framework plugin for AssemblyAI.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-assemblyai'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name12}/dist/*.whl
}

package_python-livekit-plugins-aws() {
  pkgdesc='LiveKit Agents Plugin for services from AWS.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-aws'
  depends+=('python-livekit-agents' 'python-aioboto3' 'python-amazon-transcribe')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name13}/dist/*.whl
}

package_python-livekit-plugins-azure() {
  pkgdesc='Agent Framework plugin for services from Azure Cognitive Services.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-azure'
  depends+=('python-livekit-agents' 'python-azure-cognitiveservices-speech')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name14}/dist/*.whl
}

package_python-livekit-plugins-bey() {
  pkgdesc='Agent Framework plugin for services from Beyond Presence.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-bey'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name15}/dist/*.whl
}

package_python-livekit-plugins-bithuman() {
  pkgdesc='Agent Framework plugin for services from BitHuman Avatar Rendering.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-bithuman'
  depends+=('python-livekit-agents' 'python-bithuman')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name16}/dist/*.whl
}

package_python-livekit-plugins-cartesia() {
  pkgdesc='Agent Framework plugin for voice synthesis with Cartesia API.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-cartesia'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name17}/dist/*.whl
}

package_python-livekit-plugins-clova() {
  pkgdesc="Agent Framework plugin for speech-to-text with Clova's API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-clova'
  depends+=('python-livekit-agents' 'python-pydub')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name18}/dist/*.whl
}

package_python-livekit-plugins-deepgram() {
  pkgdesc="Agent Framework plugin for services using Deepgram's API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-deepgram'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name19}/dist/*.whl
}

package_python-livekit-plugins-elevenlabs() {
  pkgdesc="Agent Framework plugin for voice synthesis with ElevenLabs' API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-elevenlabs'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name110}/dist/*.whl
}

package_python-livekit-plugins-fal() {
  pkgdesc='fal plugin template for LiveKit Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-fal'
  depends+=('python-livekit-agents' 'python-fal-client')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name111}/dist/*.whl
}

package_python-livekit-plugins-gladia() {
  pkgdesc="Agent Framework plugin for services using Gladia's API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-gladia'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy' 'python-aiohttp')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name112}/dist/*.whl
}

package_python-livekit-plugins-google() {
  pkgdesc='Agent Framework plugin for services from Google Cloud.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-google'
  depends+=('python-google-auth' 'python-google-cloud-speech' 'python-google-cloud-texttospeech' 'python-google-genai' 'python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name113}/dist/*.whl
}

package_python-livekit-plugins-groq() {
  pkgdesc='Groq inference plugin for LiveKit Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-groq'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy' 'python-livekit-plugins-openai' 'python-aiohttp' 'python-livekit')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name114}/dist/*.whl
}

package_python-livekit-plugins-hume() {
  pkgdesc='Hume TTS plugin for LiveKit agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-hume'
  depends+=('python-aiohttp' 'python-livekit-agents' 'python-hume')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name115}/dist/*.whl
}

package_python-livekit-plugins-minimal() {
  pkgdesc='Minimal plugin template for LiveKit Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-minimal'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name116}/dist/*.whl
}

package_python-livekit-plugins-neuphonic() {
  pkgdesc='Neuphonic inference plugin for LiveKit Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-neuphonic'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name117}/dist/*.whl
}

package_python-livekit-plugins-nltk() {
  pkgdesc='Agent Framework plugin for NLTK-based text processing.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-nltk'
  depends+=('python-livekit-agents' 'python-nltk')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name118}/dist/*.whl
}

package_python-livekit-plugins-openai() {
  pkgdesc='Agent Framework plugin for services from OpenAI.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-openai'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy' 'python-pillow' 'python-openai' 'python-websockets')
  optdepends=('python-google-auth: vertex')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name119}/dist/*.whl
}

package_python-livekit-plugins-playai() {
  pkgdesc="Agent Framework plugin for voice synthesis with PlayAI's API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-playai'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy' 'python-pyht' 'python-aiohttp' 'python-livekit')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name120}/dist/*.whl
}

package_python-livekit-plugins-resemble() {
  pkgdesc='LiveKit Agents Plugin for Resemble AI.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-resemble'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name121}/dist/*.whl
}

package_python-livekit-plugins-rime() {
  pkgdesc='LiveKit Agents Plugin for Rime.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-rime'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name122}/dist/*.whl
}

package_python-livekit-plugins-silero() {
  pkgdesc='Agent Framework Plugin for Silero.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-silero'
  depends+=('python-livekit-agents' 'python-onnxruntime' 'python-numpy')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name123}/dist/*.whl
}

package_python-livekit-plugins-speechify() {
  pkgdesc="Agent Framework plugin for voice synthesis with Speechify's API."
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-speechify'
  depends+=('python-livekit-agents' 'python-av' 'python-numpy')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name124}/dist/*.whl
}

package_python-livekit-plugins-speechmatics() {
  pkgdesc='Agent Framework plugin for Speechmatics.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-speechmatics'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name125}/dist/*.whl
}

package_python-livekit-plugins-tavus() {
  pkgdesc='Agent Framework plugin for Tavus.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-tavus'
  depends+=('python-livekit-agents')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name126}/dist/*.whl
}

package_python-livekit-plugins-turn-detector() {
  pkgdesc='End of utterance detection for LiveKit Agents.'
  url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-turn-detector'
  depends+=('python-livekit-agents' 'python-transformers' 'python-numpy' 'python-onnxruntime' 'python-jinja')
  cd "${srcdir}"//${_name0//livekit-/}-${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/${_name127}/dist/*.whl
}
